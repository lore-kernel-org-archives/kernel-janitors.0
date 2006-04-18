From: Andy Lutomirski <luto@myrealbox.com>
Date: Tue, 18 Apr 2006 17:45:43 +0000
Subject: [KJ] Re: [PATCH] Improved getrusage
Message-Id: <444525C7.9070301@myrealbox.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Claudio Scordino wrote:
> Hi all!
> 
> A couple of months ago we discussed the possibility of improving the getrusage 
> syscall to read usage information about tasks belonging to the same owner 
> (not just about current and children).
> 
> After an extensive discussion on the mailing list, some of us agreed about the 
> following patch. Some others, instead, said that it is too permissive. 

How about using security_ptrace?  After all, if you can ptrace it, you 
can make it call getrusage...  But add-hoc addition of "it is the same 
owner" code sounds bad for LSMs.

--Andy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
