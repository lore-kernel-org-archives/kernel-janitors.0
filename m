From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 20 Oct 2004 23:12:41 +0000
Subject: Re: [KJ] Re: [Kernel-janitors] [PATCH 2.6.9-rc2-mm4 cmipci.c]
Message-Id: <32220000.1098313960@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============9503847005980286=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <28440000.1096502897@w-hlinder.beaverton.ibm.com> <20041020230128.GB1953@stro.at>
In-Reply-To: <20041020230128.GB1953@stro.at>
To: maximilian attems <janitor@sternwelten.at>
Cc: Hanna Linder <hannal@us.ibm.com>, kernel-janitors@lists.osdl.org, greg@kroah.com, linux-kernel@vger.kernel.org, perex@suse.cz, sailer@ife.ee.ethz.ch

--===============9503847005980286==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--On Thursday, October 21, 2004 01:01:28 AM +0200 maximilian attems <janitor@sternwelten.at> wrote:

>> +		if (!pci_dev_present(intel_82437vx)) 
>                                                     ^
>>  			snd_cmipci_set_bit(cm, CM_REG_MISC_CTRL, CM_TXVX);
>>  		break;
>>  	default:
>> 
>> 
> 
> a second one with small whitespace damage.
> fixed for next kjt.

Hi Max,

According to the CodingStyle I should not put a white space
after the function name and before the parenthesis. 

I do not believe that should be added.

Thanks.

Hanna


--===============9503847005980286==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============9503847005980286==--
