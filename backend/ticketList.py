class TicketList:

    def __init__(self, userTargetList):
        self.userTargetList = userTargetList
        self.tickets = []

    def relevance(self, ticket):
        return len(ticket.targetList & self.userTargetList) - \
               len((ticket.targetList | self.userTargetList) - (ticket.targetList & self.userTargetList))/1000

    def addTicket(self, ticket):
        self.tickets += [ticket]

    def sorted(self):
        return sorted(self.tickets, cmp = lambda x, y : self.relevance(x.targetList) > self.relevance(y.targetList))
