From: Jim Nelson <james4765@cwazy.co.uk>
Date: Tue, 18 Jan 2005 20:54:04 +0000
Subject: Re: [KJ] [RFC] TODO file cleanups
Message-Id: <41ED776C.9080601@cwazy.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27822500361352587=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============27822500361352587==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Domen Puncer wrote:
> On 18/01/05 00:22 +0100, Michael Veeck wrote:
> 
>>Hi!
>>
>>I just wanted to check on how the general policy on maintaining patches 
>>is since I have done the min/max stuff and some still remain in the 
>>kernel. Mostly because the maintainers dont seem to incoporate them 
>>(isdn-eicorn for example was send nearly one year ago).
>>
>>So shall the remaining min/max stuff be left alone or should at least 
>>something be written into Documenteation/*.txt, maybe as a hint for 
>>future generations?
> 
> 
> isdn was updated 11 month ago (!), some patches seem to got merged around
> maintainers. As for min/max, i see 3 in -kj, none is isdn.
> 
> Maybe a list of files/dirs that are unmaintained / not worth patching?
> Like:
> drivers/isdn/
> fs/devfs/
> sound/oss/
> broken drivers?

Could put broken drivers in the category "You've got the hardware, you make it 
work".

--===============27822500361352587==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27822500361352587==--
