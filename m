From: Jim Nelson <james4765@cwazy.co.uk>
Date: Fri, 21 Jan 2005 22:18:32 +0000
Subject: Re: [KJ] Re: [PATCH 0/2][RESEND] acorn: clean up printk()'s
Message-Id: <41F17FB8.204@cwazy.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63924270509959502=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41F0F021.4050600@treblig.org>
In-Reply-To: <41F0F021.4050600@treblig.org>
To: kernel-janitors@vger.kernel.org

--===============63924270509959502==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Dave Gilbert (Home) wrote:
> James Nelson wrote:
> 
>> This series of patches makes the printk()'s in drivers/acorn behave a 
>> bit better.
>>
>> Re-sending them after noticing I used KERN_WARN instead of KERN_WARNING.
>>
>> Diffstat output:
>>  fd1772.c |  142 
>> +++++++++++++++++++++++++++++++--------------------------------
>>  mfmhd.c  |  138 
>> ++++++++++++++++++++++++++++---------------------------------
>>  2 files changed, 136 insertions(+), 144 deletions(-)
> 
> 
> Those files are ancient - I haven't done anything on them in yonks; the 
> right person to ask about this is Ian Molton - current maintainer of the 
> ARM26/Archimedes world cc'd).
> 
> Dave
> 
> 

So the MAINTAINERS entry:

ARM MFM AND FLOPPY DRIVERS
P:	Dave Gilbert
M:	linux@treblig.org
S:	Maintained

should be changed to:

ARM MFM AND FLOPPY DRIVERS
P:	Ian Molton
M:	spyro@f2s.com
S:	Maintained

Or should the entry be deleted?

Jim


--===============63924270509959502==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63924270509959502==--
