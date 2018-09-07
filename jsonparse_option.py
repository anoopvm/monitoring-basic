import sys
import json
from collections import OrderedDict
import optparse

def update_file(ip_file,profile_name,mmeip,mmeport):
	print(ip_file,profile_name,mmeip,mmeport)
        with open(ip_file,"r+") as f:
                data=json.load(f, object_pairs_hook=OrderedDict)
        for profile in data["ProfileArray"]:
		print("loop")
                if profile['Name']== profile_name:
			if mmeip:
	                        profile['mmeip']=mmeip
			if mmeport:
	                        profile['mmeport']=mmeport
        with open(ip_file,"w") as f:
		print("write")
		print(data)
                f.write(json.dumps(data))
                f.close()

def main():
        parser = optparse.OptionParser()
        parser.add_option('-f', action="store", dest="ip_file", help="Input File")
        parser.add_option('-n', action="store", dest="profile", help="Profile Name")
        parser.add_option('--ip',action="store", dest="ip", help="MME IP")
        parser.add_option('-p', action="store", dest="port", help="MME Port")
        options, args = parser.parse_args()
	if options.ip_file and options.profile:
		update_file(options.ip_file,options.profile,options.ip,options.port)
	else:
                parser.error("wrong number of arguments")

if __name__=="__main__":
        main()
