From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 13 Jul 2004 16:47:41 +0000
Subject: [Kernel-janitors] Re: amb_talk() (msleep)
Message-Id: <40F4122D.2040700@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35093248419217637=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============35093248419217637==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Sorry, I forgot two other locations with the same problem:

drivers/atm/idt77252.c::idt77252_close()
drivers/atm/lanai.c::lanai_shutdown_tx_vci()

-Nish

Nishanth Aravamudan wrote:
> Hi,
> 
> In continuing to replace, where appropriate, code with msleep() calls, I 
> ran across drivers/atm/ambassador.c::amb_talk():
> 
> <snip>
>  // 2.2 second wait (must not touch doorbell during 2 second DMA test)
>  timeout = HZ*22/10;
>  while (timeout)
>    timeout = schedule_timeout (timeout);
>  // give the adapter another half second?
>  timeout = HZ/2;
> <snip>
> 
> There is no call to set_current_state() before these timeouts are 
> scheduled and thus they will return immediately. If someone could tell 
> me which state (TASK_INTERRUPTIBLE or TASK_UNINTERRUPTIBLE) is desired, 
> I can fix this and perhaps replace the calls with msleep().
> 
> Thanks,
> Nish
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors
> 


--===============35093248419217637==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35093248419217637==--
