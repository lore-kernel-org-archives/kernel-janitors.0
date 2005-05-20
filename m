From: Jesse Millan <jesse.millan@gmail.com>
Date: Fri, 20 May 2005 19:51:57 +0000
Subject: Re: [KJ] [PATCH] Fix gcc4 warning, idx may be used uninitialized
Message-Id: <428E3FDD.5000601@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


So, the compiler should be able to tell that either one of the two cases
apply?

a: an assignment statement will be done on idx before its ever read

or

b: no assignment statement, control flow will never allow idx to be read

Alexey Dobriyan wrote:
> On Friday 20 May 2005 22:53, Jesse Millan wrote:
> 
>>This patch eliminates the warning that is generated when passing an
>>uninitialized variable to a function, and in that function it 'looks'
>>like you may read the contents.
>>
>>In this case, the address of a local variable 'idx' is passed to the
>>function bvec_alloc_bs(). Inside bvec_alloc_bs(), it is possible that
>>no value will be assigned to idx, in which case the function immediately
>>returns null and does not go on to read it. Human eyes can see that its
>>safe.
> 
> 
> I think this should go straight to http://gcc.gnu.org/bugzilla/enter_bug.cgi
> 

-- 
Jesse Millan
CNS Unix Team
Portland State University
Phone: (503) 725-9151
Mobile: (503) 453-0748
GPG key: www.system-calls.com/gpg.php

grep --recursive --ignore-case 'SHOULD WORK' /usr/src/linux/* | wc
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
