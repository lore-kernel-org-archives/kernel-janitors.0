From: Marcel Holtmann <marcel@holtmann.org>
Date: Fri, 23 Jul 2004 08:45:24 +0000
Subject: Re: [Kernel-janitors] [PATCH] bluetooth/bluecard: replace
Message-Id: <1090572324.21828.56.camel@pegasus>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============95121753735730918=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040722214224.GH2165@us.ibm.com>
In-Reply-To: <20040722214224.GH2165@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============95121753735730918==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Nish,

> I am really sorry for this, but I didn't change what I had changed
> before in the compileable patch (msleep(10) instead of mlseep(100)).
> This is the final one, I swear (I think).
> 
> Please find below the corrected version, which compiles without error
> for me.
> 
> I would appreciate any comments from the janitors list. This is one (of
> many) cases where I made a decision about replacing
> 
> set_current_state(TASK_INTERRUPTIBLE);
> schedule_timeout(some_time);
> 
> with
> 
> msleep(jiffies_to_msecs(some_time));
> 
> msleep() is not exactly the same as the previous code, but I only did
> this replacement where I thought long delays were *desired*. If this is
> not the case here, then just disregard this patch.

you haven't had to resend the patches. I already applied all of them and
fixed the warning in my tree. And I took the right one for bluecard_cs.

Regards

Marcel



--===============95121753735730918==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============95121753735730918==--
