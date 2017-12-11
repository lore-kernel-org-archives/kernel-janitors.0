From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 11 Dec 2017 08:15:36 +0000
Subject: Re: TC: Delete an error message for a failed memory allocation in tc_bus_add_devices()
Message-Id: <60e20b6d-e130-9c18-d5d4-b75349f0d7be@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bfb63956-346c-aa17-5b06-fbe19ff0a5e3@users.sourceforge.net>
 <alpine.LFD.2.21.1712102140570.4266@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.21.1712102140570.4266@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Maciej W. Rozycki" <macro@linux-mips.org>, linux-mips@linux-mips.org
Cc: =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> Omit an extra message for a memory allocation failure in this function.
>>
>> This issue was detected by using the Coccinelle software.
> 
>  And the problem here is?

I suggest to reconsider the relevance of another error message.
Would you like to achieve a better explanation for this use case?

* Do you find the wording “WARNING: Possible unnecessary 'out of memory' message”
  from the script “checkpatch.pl” more appropriate?

* Can a default Linux allocation failure report be sufficient?

Regards,
Markus
