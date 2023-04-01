for itcount=50:-1:1,
    thestr=sprintf('print -deps plot%d',itcount);
    eval(thestr);
    close   % current figure closed
end; clear itcount

