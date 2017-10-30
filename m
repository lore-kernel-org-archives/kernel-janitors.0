From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 30 Oct 2017 19:32:15 +0000
Subject: Re: pinctrl: sirf: Use common error handling code in sirfsoc_dt_node_to_map()
Message-Id: <72b04f56-be81-5a7d-3a43-abac41dd05ba@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <80911d4b-d819-335c-106e-70d7672e645b@users.sourceforge.net>
 <CAMuHMdXSVXZNW7a-xf_zyCW-j_KVQbRBdrt8q-SNjGChuDU-bw@mail.gmail.com>
In-Reply-To: <CAMuHMdXSVXZNW7a-xf_zyCW-j_KVQbRBdrt8q-SNjGChuDU-bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

>> Add a jump target so that a bit of exception handling can be better reused
>> at the end of this function.
>>
>> This issue was detected by using the Coccinelle software.
> 
> Does Coccinelle have a threshold for how much cleanup can be shared?

Are you looking for a limitation of such source code search patterns?

Regards,
Markus
