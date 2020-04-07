From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 07 Apr 2020 14:45:55 +0000
Subject: Re: [PATCH RT] signal: Prevent double-free of user struct
Message-Id: <7be9cee2-6db5-3724-c6e5-58ff51680e36@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Matt Fleming <matt@codeblueprint.co.uk>, linux-rt@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Wagner <wagi@monom.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>

>  refcount_t: underflow; use-after-free.

I suggest to add the tag “Fixes” to the final change description.

Regards,
Markus
