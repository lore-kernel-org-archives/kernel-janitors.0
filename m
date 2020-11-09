From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 09 Nov 2020 14:13:15 +0000
Subject: Re: net: dsa: hellcreek: Add support for hardware timestamping
Message-Id: <b71b9ba5-c0f1-091f-be4a-8bfb365af87b@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7c4b526c-b229-acdf-d22a-2bf4a206be5b@canonical.com>
 <87v9eer5qm.fsf@kurt>
In-Reply-To: <87v9eer5qm.fsf@kurt>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kurt Kanzenbach <kurt@linutronix.de>, Kamil Alkhouri <kamil.alkhouri@hs-offenburg.de>, Richard Cochran <richardcochran@gmail.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, ivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On 09/11/2020 13:59, Kurt Kanzenbach wrote:
> Hi Colin,
> 
> On Mon Nov 09 2020, Colin Ian King wrote:
>> Hi
>>
>> Static analysis on linux-next with Coverity has detected a potential
>> null pointer dereference issue on the following commit:
>>
>> commit f0d4ba9eff75a79fccb7793f4d9f12303d458603
>> Author: Kamil Alkhouri <kamil.alkhouri@hs-offenburg.de>
>> Date:   Tue Nov 3 08:10:58 2020 +0100
>>
>>     net: dsa: hellcreek: Add support for hardware timestamping
>>
>> The analysis is as follows:
>>
>> 323                /* Get nanoseconds from ptp packet */
>> 324                type = SKB_PTP_TYPE(skb);
>>
>>    4. returned_null: ptp_parse_header returns NULL (checked 10 out of 12
>> times).
>>    5. var_assigned: Assigning: hdr = NULL return value from
>> ptp_parse_header.
>>
>> 325                hdr  = ptp_parse_header(skb, type);
>>
>>    Dereference null return value (NULL_RETURNS)
>>    6. dereference: Dereferencing a pointer that might be NULL hdr when
>> calling hellcreek_get_reserved_field.
>>
>> 326                ns   = hellcreek_get_reserved_field(hdr);
>> 327                hellcreek_clear_reserved_field(hdr);
>>
>> This issue can only occur if the type & PTP_CLASS_PMASK is not one of
>> PTP_CLASS_IPV4, PTP_CLASS_IPV6 or PTP_CLASS_L2.  I'm not sure if this is
>> a possibility or not, but I'm assuming that it would be useful to
>> perform the null check just in case, but I'm not sure how this affects
>> the hw timestamping code in this function.
> 
> I don't see how the null pointer dereference could happen. That's the
> Rx path you showed above.
> 
> The counter part code is:
> 
> hellcreek_port_rxtstamp:
> 
> 	/* Make sure the message is a PTP message that needs to be timestamped
> 	 * and the interaction with the HW timestamping is enabled. If not, stop
> 	 * here
> 	 */
> 	hdr = hellcreek_should_tstamp(hellcreek, port, skb, type);
> 	if (!hdr)
> 		return false;
> 
> 	SKB_PTP_TYPE(skb) = type;
> 
> Here the type is stored and hellcreek_should_tstamp() also calls
> ptp_parse_header() internally. Only when ptp_parse_header() didn't
> return NULL the first time the timestamping continues. It should be
> safe.
> 
> Also the error handling would be interesting at that point. What should
> happen if the header is null then? Returning an invalid timestamp?
> Ignore it?
> 
> Hm. I think we have to make sure that it is a valid ptp packet before
> reaching this code and that's what we've implemented. So, I guess it's
> OK.

OK - thanks, I'll mark this as a false positive.

> 
> Thanks,
> Kurt
> 
