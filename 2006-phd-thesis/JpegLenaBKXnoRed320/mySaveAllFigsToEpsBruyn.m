for itcount=14:-1:1,
    thestr=sprintf('print -deps bruynplot%d',itcount);
    eval(thestr);
    close   % current figure closed
end; clear itcount
