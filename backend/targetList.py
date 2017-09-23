class Target:
    def __init__(self, targetType):
        self.targetType = targetType

    def __str__(self):
        return self.targetType


class TargetList:
    setOfTarget = set()

    def AddTarget(self, target):
        self.setOfTarget += target

    def __str__(self):
        return str(self.setOfTarget)
