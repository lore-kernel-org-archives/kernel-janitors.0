From: Mark McClelland <mark@alpha.dyndns.org>
Date: Wed, 28 Jul 2004 12:48:06 +0000
Subject: [Kernel-janitors] Re: [PATCH] usb/ov511: replace schedule_timeout()
Message-Id: <4107A086.8090104@alpha.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47319168095103836=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============47319168095103836==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Nishanth Aravamudan wrote:

>I would appreciate any comments from the janitors list. 
>
>Applys-to: 2.6.7
>
>Description: Use msleep() instead of schedule_timeout() to 
>guarantee the task delays for the desired time.
>  
>

Looks good to me. Thank you very much for finding and fixing this, Nishanth.

>Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
>

Signed-off-by: Mark McClelland <mark@alpha.dyndns.org>

-- 
Mark McClelland
mark@alpha.dyndns.org


--===============47319168095103836==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47319168095103836==--
