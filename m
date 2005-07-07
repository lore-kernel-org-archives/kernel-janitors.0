From: Jesse Millan <jessem@cs.pdx.edu>
Date: Thu, 07 Jul 2005 22:28:10 +0000
Subject: Re: [KJ] Simple task for a newbie.
Message-Id: <42CDAC7A.6080300@cs.pdx.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cbecb304050707144479d37993@mail.gmail.com>
In-Reply-To: <cbecb304050707144479d37993@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Rodrigo Nascimento wrote:
> Someone can tell me a task that a newbie can do?
> 
> I want to help, but without confuse.
> 

I recommend reading all the documents suggested in the README file.
Then, pick something relatively easy in the TODO file. Send the patch to
patch-tester@coderock.org over and over till you get it right ;-). Then
send it to the Kernel-Janitor list.

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
https://lists.osdl.org/mailman/listinfo/kernel-janitors
