import pandas as pd



file_name = input('请输入文件名：')
data = pd.read_csv(file_name, encoding="utf-8",error_bad_lines=False,header=None,names=list(range(1000)),index_col=0)
biao = []
idx = ['B19', 'B20', 'B21', 'B22', 'B23', 'B24', 'B25', 'B26', 'B27', 'B28', 'B29', 'B30', 'B31','B32','B33', 'B34', 'B35', 'B36','B37', 'B38', 'B39', 'B40', 'B41', 'B42', 'B43', 'B44', 'B45', 'B46', 'B47', 'B48', 'B49', 'B61', 'B65', 'B68', 'B72', 'B75', 'B76', 'B78', 'B79', 'B80', 'B81', 'B82', 'B83', 'B323', 'B324', 'B325', 'B326', 'B327', 'B329', 'B330', 'B351', 'B352', 'B353', 'B354', 'B355', 'B357', 'B386', 'B387', 'B388', 'B390', 'B393', 'E403', 'E405', 'E406', 'E408', 'E417', 'E418', 'E437', 'E439', 'E421', 'E444', 'E445', 'E446', 'E447', 'E448', 'E449', 'E453', 'E454', 'E455', 'E456', 'E457', 'E473', 'E474', 'E475', 'E476', 'E477', 'E478', 'E484', 'E485', 'E486', 'E487', 'E488', 'E489', 'E490', 'E491', 'E492', 'E493', 'E494', 'E495', 'E496', 'E497', 'E498', 'E499', 'E500', 'E501', 'E502', 'E503', 'E504', 'E505', 'E506']
data = data.dropna(axis=1,how='all')
data = data.fillna(0)
out = pd.DataFrame(columns=idx)
le = len(data.columns)
for i in range(0,len(data),2):
    name = data[i:i+2].iloc[1].name
    print(name)
    l = []
    ls = data[i:i+2].copy()
    ls.columns = list(ls.loc['species'])
    for i in idx:
        if i in list(ls.columns):
            l.append(ls[i].iloc[1])
        else:
            l.append(0)
    out.loc[name] = l
print('写入out.csv')
out.to_csv('out.csv')
