class Target:
    targetType = ""

    def __init__(self, _targetType):
        self.targetType = _targetType

    def __str__(self):
        return self.targetType


class TargetList:
    setOfTarget = set()

    def AddTarget(self, target):
        self.setOfTarget += target

    def __str__(self):
        return str(self.setOfTarget)
