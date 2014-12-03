From: Arend van Spriel <arend@broadcom.com>
Date: Wed, 03 Dec 2014 19:13:41 +0000
Subject: Re: [patch] CodingStyle: add some more error handling guidelines
Message-Id: <547F60E5.50705@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141202085950.GA13434@mwanda> <547F0297.6030202@users.sourceforge.net> <20141203124511.GR5048@mwanda> <547F0977.7090908@users.sourceforge.net> <20141203132002.GT5048@mwanda> <547F0F2A.3060708@users.sourceforge.net> <547F1942.5060502@broadcom.com> <547F33AC.50002@users.sourceforge.net>
In-Reply-To: <547F33AC.50002@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Julia Lawall <julia.lawall@lip6.fr>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Coccinelle <cocci@systeme.lip6.fr>, backports@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "Luis R. Rodriguez" <mcgrof@suse.com>

On 12/03/14 17:00, SF Markus Elfring wrote:
>>> Which name pattern do you find more appropriate in such
>>> an use case?
>>
>> I think Dan wants the label to be descriptive about the tasks
>> needed in the exception handling itself.
>
> I would usually prefer also such a target-oriented labelling
> for the affected identifiers.
> How are the chances to express an expectation in this direction
> unambiguously for the proposed coding style update?
>
>
>> This makes sense as the exception handling steps may be reused
>> for different failures in the code.
>
> I would stress a different reason from my point of view.

I meant as apposed to using a goto-/source-oriented labelling. Please 
provide your point of view. That way the explanations given in this 
email exchange might be incorporated in the next round of the proposed 
update or at least be used as input.

Regards,
Arend
