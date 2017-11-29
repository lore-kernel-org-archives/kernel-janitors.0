From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 29 Nov 2017 14:04:31 +0000
Subject: Re: [3/3] pinctrl: mcp23s08: Combine two function calls in mcp23s08_dbg_show()
Message-Id: <2132d281-c4da-81b0-6dc7-4b42807cebf0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ca1c3c19-7e8c-90f0-493c-b6fae04e6a03@users.sourceforge.net>
 <0510a811-e653-6310-5c7f-8d6434efca2a@users.sourceforge.net>
 <CACRpkdaoUad0i3Kddyp0aJRJ46frHMY9_57mwM3iXAhqL5V3aA@mail.gmail.com>
In-Reply-To: <CACRpkdaoUad0i3Kddyp0aJRJ46frHMY9_57mwM3iXAhqL5V3aA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Sebastian Reichel <sebastian.reichel@collabora.co.uk>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> * Print a line break together with other data in a single function call.
>>
>> * Adjust indentation.
…
> 
> This does not apply.
> Possibly depends on 2/3.

Partly, yes.


How do you think about the following possibilities?

* Omit two context lines at the end from this update step.
  or
* Refer to the jump label “done” (instead of renaming it to “unlock” before).


Would you try once more to integrate the shown small change?

Regards,
Markus
