From: Brian King <brking@us.ibm.com>
Date: Tue, 13 Jul 2004 17:57:37 +0000
Subject: [Kernel-janitors] Re: no set_current_state() before
Message-Id: <40F42291.5010202@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63024405579190867=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============63024405579190867==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Since I'm not seeing a return value on msleep to be able to tell if it 
terminates prematurely, TASK_UNINTERRUPTIBLE is the preferred state.

Thanks

-Brian

Nishanth Aravamudan wrote:
> Hi,
> 
> In continuing to replace, where appropriate, code with msleep() calls, I 
> ran across the following file(s) / function(s), which do not invoke 
> set_current_state() before schedule_timeout(), which causes the latter 
> to return immediately:
> 
> drivers/scsi/ipr.c::ipr_store_diagnostics()
> 
> If someone could tell me which state (TASK_INTERRUPTIBLE or 
> TASK_UNINTERRUPTIBLE) is desired, I can fix this and perhaps replace the 
> calls with msleep().
> 
> Thanks,
> Nish
> 

-- 
Brian King
eServer Storage I/O
IBM Linux Technology Center


--===============63024405579190867==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63024405579190867==--
