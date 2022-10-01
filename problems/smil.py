import re
print("\n".join([str(m.start()) for m in re.finditer('[:;]-?\)',input())]))
