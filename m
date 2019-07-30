From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 30 Jul 2019 11:37:09 +0000
Subject: Re: [PATCH][next] mlxsw: spectrum_ptp: fix duplicated check on orig_egr_types
Message-Id: <85e79b89-9d48-8aa2-b96f-7d30a5716d59@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190730102114.1506-1-colin.king@canonical.com>
 <87mugvzt1m.fsf@mellanox.com> <87imrjzsgu.fsf@mellanox.com>
In-Reply-To: <87imrjzsgu.fsf@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Petr Machata <petrm@mellanox.com>
Cc: Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, "David S . Miller" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 30/07/2019 12:12, Petr Machata wrote:
> 
> Petr Machata <petrm@mellanox.com> writes:
> 
>> Colin King <colin.king@canonical.com> writes:
>>
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> Currently there is a duplicated check on orig_egr_types which is
>>> redundant, I believe this is a typo and should actually be
>>> orig_ing_types || orig_egr_types instead of the expression
>>> orig_egr_types || orig_egr_types.  Fix this.
>>
>> Good catch, yes, there's a typo. Thanks for the fix!
>>
>>> Addresses-Coverity: ("Same on both sides")
>>> Fixes: c6b36bdd04b5 ("mlxsw: spectrum_ptp: Increase parsing depth when PTP is enabled")
>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>
>> Reviewed-by: Petr Machata <petrm@mellanox.com>
> 
> I see that there is an identical problem in the code one block further.
> Can you take care of that as well, please? Or should I do it?
> 
I'll sort that out too
