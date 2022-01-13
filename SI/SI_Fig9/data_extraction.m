for i = 1:1:99
    model = mphload(['euler_3D_',num2str(i),'.mph']);
    
    filename = ['D:\Xinru\comsol models\simulation result\SCITAS result\',num2str(i),'_result_30.txt'];
    
    model.result.numerical('gev1').set('table', 'tbl12');
    model.result.numerical('gev1').appendResult;
    model.result.table('tbl12').clearTableData;
    model.result.numerical('gev1').set('table', 'tbl12');
    model.result.numerical('gev1').setResult;
    model.result.table('tbl12').save(filename);
end
