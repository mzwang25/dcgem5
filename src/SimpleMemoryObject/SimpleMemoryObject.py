from m5.params import *
from m5.proxy import *
from m5.SimObject import SimObject

class SimpleMemoryObject(SimObject):
    type = 'SimpleMemoryObject'
    cxx_header = "SimpleMemoryObject/SimpleMemoryObject.hh"

    inst_port = SlavePort("CPU side port, receives requests")
    data_port = SlavePort("CPU side port, receives requests")
    mem_side = MasterPort("Memory side port, sends requests")