From: Jim Nelson <james4765@verizon.net>
Date: Mon, 20 Dec 2004 21:51:39 +0000
Subject: [KJ] Re: [PATCH] pcxx: replace cli()/sti()
Message-Id: <41C7496B.4000401@verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40153209651765787=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041217223426.11143.44338.87156@localhost.localdomain>	 <1103554747.30268.24.camel@localhost.localdomain> <1103574222.31479.12.camel@localhost.localdomain>
In-Reply-To: <1103574222.31479.12.camel@localhost.localdomain>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: kernel-janitors@lists.osdl.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, akpm@osdl.org

--===============40153209651765787==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Alan Cox wrote:
> On Llu, 2004-12-20 at 14:59, Alan Cox wrote:
> 
>>On Gwe, 2004-12-17 at 22:34, James Nelson wrote:
>>
>>>-	save_flags(flags);
>>>-	cli();
>>>+	spin_lock_irqsave(&pcxx_lock, flags);
>>> 	del_timer_sync(&pcxx_timer);
>>
>>Not safe if the lock is grabbed by the timer between the lock and the
>>irqsave as it will spin on another cpu and the timer delete will never
>>finish.
> 
> 
> Error between brain and keyboard
> 
> Between the lock and the timer_delete of course
> 

Right.

Go ahead and ignore that set of cli()/sti() patches - I'll have to take them a 
little slower, checking for potential deadlocks and other nastiness.

I'll try again in a week or so - gotta finish "The Design of the Unix Operating 
System" first.  Love early Xmas presents from my aunt, the mainframe systems 
programmer... :)

--===============40153209651765787==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40153209651765787==--
