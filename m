From: walter harms <wharms@bfs.de>
Date: Thu, 01 Mar 2012 15:00:03 +0000
Subject: Re: [PATCH 1/3] netfilter: Fix copy_to_user too small size parametre.
Message-Id: <4F4F8EF3.3040102@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1330593390-19233-1-git-send-email-santoshprasadnayak@gmail.com>
In-Reply-To: <1330593390-19233-1-git-send-email-santoshprasadnayak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 01.03.2012 14:03, schrieb Pablo Neira Ayuso:
> On Thu, Mar 01, 2012 at 04:15:05PM +0530, santosh prasad nayak wrote:
>> Hi Pablo.
>>
>> copy_to_user( dest, source, length)
>>
>> Normally,  'length'  is equal to  'sizeof (source) '.
>>
>> In this case "length"   =   32
>>        "sizeof(source)"  =   29.
>>
>> Is it intentional ?
> 
> ebtables expects 32 bytes names.
> 
>> Won't it copy extra 3 bytes of kernel data to userspace ?
> 
> You're right. We have to copy 29 bytes but we have to fill the
> remaining bytes with zeroes. I think something like:
> 
> char name[EBT_FUNCTION_MAXNAMELEN] = {};
> 
> /* user-space ebtables expects 32 bytes-long names, but xt_match uses
>  * 29 bytes for that. */
> sprintf(name, "%s", m->u.match->name);
> if (copy_to_user(hlp, name, EBT_FUNCTION_MAXNAMELEN))
> ...
> 

it may be better to use kstrncpy() here. kstrncpy will fill remaining
space with 0. now you are using char name[EBT_FUNCTION_MAXNAMELEN] later
this may change, better safe than sorry.

re,
 wh


> will resolve this issue.
> 
> Would you resend a new patch?
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
