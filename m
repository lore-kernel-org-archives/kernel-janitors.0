From: Gustavo Franco <stratus@acm.org>
Date: Mon, 26 Apr 2004 00:47:33 +0000
Subject: Re: [Kernel-janitors] [PATCH] Replaces yield() with schedule_timeout()
Message-Id: <408C5C25.3010506@acm.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13202009498621337=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <408AB344.6010000@acm.org>
In-Reply-To: <408AB344.6010000@acm.org>
To: kernel-janitors@vger.kernel.org

--===============13202009498621337==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Randy.Dunlap wrote:

>| Hi Domen,
>| 
>| My failure, i haven't checked if the set_current_state() was really 
>| needed.I'm working
>| on the TODO item "Calling yield() Considered Harmful" written by Matthew 
>| Wilcox.Since
>| set_current_state() isn't cited by him and wasn't by Randy, i'll wait 
>| until Randy ask for rediffied
>| patches.Randy?
>
>Yes, looks like Domen is correct.  He's right about the source code comment.
>Then I looked at 25 source files that use schedule_timeout() and all of
>them set current state first.
>
>I'll update the TODO list with this info.
>
>  
>
Randy,

So, do you need "rediffied" patches with set_current_state() calls, right?

Thanks,
Gustavo Franco

--===============13202009498621337==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13202009498621337==--
