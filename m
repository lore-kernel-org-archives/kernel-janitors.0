From: aLeJ <fuzzy.alej@gmail.com>
Date: Thu, 30 Jun 2005 17:53:54 +0000
Subject: Re: [KJ] fs/smbfs/proc.c -> replace direct assignment with
Message-Id: <1120160937.26352.3.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26783865204396839=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1120126573.24539.6.camel@localhost>
In-Reply-To: <1120126573.24539.6.camel@localhost>
To: kernel-janitors@vger.kernel.org

--===============26783865204396839==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> the memory barrier is really necessary (as pointed out earlier in the list
> by Nishanth Aravamudan)?  if not, __set_current_state does the job.
> 
> I'd appreciate some notes/thoughts/tips/whatever on which conditions a
> memory barrier is really needed, or, more clearly, when the absence of a
> memory barrier breaks stuff.
> 
> TIA :)

As said in the TODO:

"...
Don't forget to set_current_state(TASK_{,UN}INTERRUPTIBLE); before
schedule*().
..."

And in this case, it is just before schedule, so I considered to change it.
Maybe the use of __set_current is for places where there is not schedule?
(Just a try :p)


--===============26783865204396839==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26783865204396839==--
