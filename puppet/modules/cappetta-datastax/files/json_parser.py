#@author:~Cappetta
#@purpose: test automation & sanity validations

import json, pytest, time, logging, os
from pprint import pprint

###########################################################
### Logging Initialization
###########################################################


def logsetup():
# logfile = "/tmp/api.log"
    dt_stamp = time.strftime("%m%d%Y")
    #set this to identify the home_dir of the output files
    output_dir="./"
    logfile = output_dir + "test_automation" + dt_stamp + ".log"
    if os.path.exists(logfile):
        os.remove(logfile)
    log = logging.getLogger('log')
    log.setLevel(logging.DEBUG)
    fileHandle = logging.FileHandler(logfile)
    fileHandle.setLevel(logging.DEBUG)
    fileHandle.setFormatter(logging.Formatter('%(asctime)s - %(name)s - (%(threadName)-10s) - %(levelname)s - %(message)s'))
    log.addHandler(fileHandle)
    log.debug("initializing validations")
    return log


# def create_event_list:
# current amqp files requires a sed statement to add [] & commas
with open('test.nova.js') as data_file:
	data = json.load(data_file)
#print out

#dynamic detection of the events
list=[]
for rec in data:
    # print "rec: %s" % rec['event_type']
    list.append(rec['event_type'])


# logic
# - identify unique event types & create data model of different
# - each message has a possibly different model (core elements various nested elements)
# - critical msg types are identified for monitoring
# - establish transformational logic & build unit tests

# create a dynamic dict of key mappings from message types
dict ={}
it = 0
payload = []
nl="\n######################################\n"
log=logsetup()

for event in set(list):
    dict[event] = []

for rec in data:
     dict[rec["event_type"]].append(it)
     it += 1
sum=0

log.debug("total records processed: %s" % it)
print "total records processed: %s" % it

#todo: assert that the total records == the sum of key sizes below
for key in dict.keys():
    log.debug("key: %s ==> size: %s" % (key, len(dict[key])))
    # print("key: %s ==> size: %s" % (key, len(dict[key])))
    sum += (sum + len(dict[key]))

# key: image.send ==> size: 302
# key: image.delete ==> size: 236
# key: image.upload ==> size: 201
# key: image.activate ==> size: 204
# key: image.update ==> size: 430
# key: image.prepare ==> size: 209
# key: image.create ==> size: 213

# todo: for each record thread the ability to rapidly write/record the activity multiple times to the cassandra cluster
# These are the numerical
# for rec in dict['compute.instance.create.start']:
#     # need to perform data element validation as multiple deleted events have no deleted_at timestamp.
#     log.debug("data:: event::%s, priority::%s, created_at::%s, updated_at:: %s, deleted_at:: %s, id:: %s" % (data[rec]['event_type'], data[rec]['priority'], data[rec]['payload']['created_at'], data[rec]['payload']['created_at'],
#                                                                                                              data[rec]['payload']['deleted_at'], data[rec]['payload']['instance_id']))

def parse_record(recs):
    log.debug(nl)
    for element in recs:
        # print "recs == %s" % element
        log.debug("payload %s ==> Length: %s" % (data[element]['payload'],len(data[element]['payload'])))


for event in dict.keys():
    # for rec in dict[event]:
    # need to perform data element validation as multiple deleted events have no deleted_at timestamp.
    #     log.debug("data:: event::%s, priority::%s, created_at::%s, updated_at:: %s, deleted_at:: %s, id:: %s" % (data[rec]['event_type'], data[rec]['priority'], data[rec]['payload']['created_at'], data[rec]['payload']['created_at'],
    #                                                                                                              data[rec]['payload']['deleted_at'], data[rec]['payload']['instance_id']))
    log.debug("[Data Stat](1) event %s len %s " % (event, len(dict[event])))
    # if event == 'compute.instance.snapshot.end':
    parse_record(dict[event])



# @author: amulya
# additional collaborators: cappetta
# @file: file of
def parse_events(file):
    # print nl,nl,nl,file,nl,nl,nl
    for line in file:
        # print line
        if "instance" in line:
            print nl,"Perform Assertion Checks - Instance Sanity",nl
            print "Assertion Checks - Instance Scenario Match"
            log.debug(line)
            # parts = line.split(':')
            # inst_id = parts[1]
        # print nl,"Perform Assertion Checks - Volume",nl
        if "volume" in line:
            pass
        # parts = line.split(':')
        # vol_id = parts[1]
        # print nl,"Perform Assertion Checks - Router",nl
        if "router" in line:
            pass
        # parts=line.split(':')
        # router_id=parts[1]
        # print nl,"Perform Assertion Checks - Network",nl
        if "network" in line:
            pass
            # parts=line.split(':')
            # net_id=parts[1]

parse_events(data)

print "todo: pass/fail count & results"

print "categorize tests for automated defect density"


def test_compare():
    f1 = 1
    f2 = 2
    assert f1 == f2

test_compare()

# messages have different sizes and critical elements are expected, standard metadata values are expected as well as updates.
# classify messages by dict w/ multiple keys : e.g. # of elements, event_id, event_type,