function customReduce(arr, fn) {
    let sum =0;
    for(var i =0; i< arr.length; i++) {
        sum += arr[i];
        fn(sum, arr[i]);
    }
    return sum;
}

var cusval=customReduce(intArray,(sum,arrele)=>{
    sum=sum+arrele;
});
console.log(intArray)
console.log(cusval)