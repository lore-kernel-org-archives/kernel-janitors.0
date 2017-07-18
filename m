From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 18 Jul 2017 15:08:30 +0000
Subject: Re: [PATCH] platform/x86: peaq-wmi: silence a static checker warning
Message-Id: <CAHp75VdSD0zVFtnwF8oWt24P8DM6vZQNO93F_38yaCYBzCCBRw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170718092849.nim5tiaycdenfyfz@mwanda>
In-Reply-To: <20170718092849.nim5tiaycdenfyfz@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Darren Hart <dvhart@infradead.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Jul 18, 2017 at 12:28 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> Static checkers complain because:
>
>         if (peaq_ignore_events_counter && --peaq_ignore_events_counter >= 0)
>                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> The second part of the condition is always true because
> "peaq_ignore_events_counter" is unsigned.  It doesn't cause a problem
> because the first part of the condition prevents underflows, but it's
> simple enough to make the static checker happy.

Isn't it the same to

if (peaq_ignore_events_counter && peaq_ignore_events_counter--)

?

-- 
With Best Regards,
Andy Shevchenko
