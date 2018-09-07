import sys
import json
from collections import OrderedDict

def main(argv):
	with open(argv[1],"r+") as f:
		data=json.load(f, object_pairs_hook=OrderedDict)
	for profile in data["ProfileArray"]:
		if profile['Name']==argv[2]:
			profile['mmeip']=argv[3]
			profile['mmeport']=argv[4]
	with open(argv[1],"w") as f:
		f.write(json.dumps(data))
		f.close()
	
if __name__=="__main__":
	main(sys.argv)
