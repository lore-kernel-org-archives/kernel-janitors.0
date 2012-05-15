From: "Arend van Spriel" <arend@broadcom.com>
Date: Tue, 15 May 2012 14:28:37 +0000
Subject: Re: [patch] brcm80211: brcmu_pkt_buf_free_skb() should handle NULL
Message-Id: <4FB26815.9090400@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120515090027.GG30265@elgon.mountain>
 <4FB26664.2080008@broadcom.com>
In-Reply-To: <4FB26664.2080008@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Brett Rudley <brudley@broadcom.com>, Roland Vossen <rvossen@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Kan Yan <kanyan@broadcom.com>, "John W. Linville" <linville@tuxdriver.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On 05/15/2012 04:21 PM, Arend van Spriel wrote:
> On 05/15/2012 11:00 AM, Dan Carpenter wrote:
>> This is potentially called with NULL pointers, for example, look at
>> brcmf_c_prec_enq().  Since it's a free() function, probably people
>> expect it to handle NULL pointers.
> 
> Acked-by: Arend van Spriel <arend@broadcom.com>
> 
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>

Hi Dan,

By the way. You cc'ed Greg <gregkh@suse.de> but he moved to linux
foundation.

Gr. AvS


