From: walter harms <wharms@bfs.de>
Date: Wed, 26 Jan 2005 17:55:51 +0000
Subject: Re: [KJ] [PATCH 19/34]: include/jiffies: add usecs_to_jiffies()
Message-Id: <41F7D9A7.9070405@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18678729073293221=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050126173632.GA2758@us.ibm.com>
In-Reply-To: <20050126173632.GA2758@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============18678729073293221==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


hi Nish,
do we need jiffies_to_msecs() at all ?

milli is 10E-3   micro is 10E-6
i would say:
#define jiffies_to_msecs(VAL) jiffies_to_usecs(1000*VAL)

I have no idea about the range of VAL but uint is ~ 1E9.
is anyone using something like 1E6 ms = 1E3s to wait ?
if not we kan simply drop jiffies_to_msecs() (and back).

re,
   walter




Nishanth Aravamudan wrote:
> On Tue, Jan 25, 2005 at 06:51:00PM -0800, Andrew Morton wrote:
> 
>>Nishanth Aravamudan <nacc@us.ibm.com> wrote:
>>
>>>Please consider applying.
>>>
>>> Description: Add a usecs_to_jiffies() function.
>>
>>Please cc linux-kernel on things which aren't utterly trivial?
> 
> 
> Sorry, Andrew, I actually meant to, but forgot to change the CC line. Sorry for
> the noise directly to you.
> 
> -Nish
> 
> Description: Add a usecs_to_jiffies() function. This will be used in one of my
> subsequent patches. With the potential for dynamic HZ values much higher than
> 1000, we may need to consider times as small as usecs in terms of jiffies.
> We have msecs_to_jiffies(), jiffies_to_msecs() and jiffies_to_usecs(), but no
> usecs_to_jiffies(). Please check my math.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
>

--===============18678729073293221==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18678729073293221==--
