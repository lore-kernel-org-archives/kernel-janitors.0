From: walter harms <wharms@bfs.de>
Date: Wed, 26 Jan 2005 08:34:35 +0000
Subject: Re: [KJ] [RFC] TODO file cleanups
Message-Id: <41F7561B.2040000@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99029599380714517=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============99029599380714517==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alexey,
whats about something like "pedantic" or so ? the target would be to 
make the kernel compile without warnings. you can add more tests every 
level we clean. Also so to run programms that check for missing KERN_
what is already done to make sure noone introduces them again.

(perhaps a "pedandic=<level>" ?)

re,
walter


> 
> 
> Also sparse warnings? Use -Wbitwise for _even more_ janitor work. :-)
> 
> Today somebody mentioned "make randconfig" on lkml. What about
> 
> 	$ make randconfig
> 	Find out why it doesn't build. Don't forget to save .config.	?
> 
> I can add these three in a couple of days.
> 
> 	Alexey
> 

--===============99029599380714517==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99029599380714517==--
