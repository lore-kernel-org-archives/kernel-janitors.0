From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 11 Oct 2019 05:00:19 +0000
Subject: Re: string.h: Mark 34 functions with __must_check
Message-Id: <adc2ab99-1a5b-d381-e96c-6801e18f3735@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de>
 <20191009110943.7ff3a08a@gandalf.local.home>
 <CAKwvOdk3OTaAVmbV9Cu+Dzg8zuojjU6ENZfu4cUPaKS2a58d3w@mail.gmail.com>
 <4d890cae9cbbd873096cb1fadb477cf4632ddb9a.camel@perches.com>
 <CAKwvOdntBXd3OPiCV5adcDjXor886-XnsSxcStAjYBJpuEBrqQ@mail.gmail.com>
 <20191010142733.GT2751@twin.jikos.cz>
 <9b331c1184aca8a32b9132d29957cd5e8bef1c1d.camel@perches.com>
In-Reply-To: <9b331c1184aca8a32b9132d29957cd5e8bef1c1d.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org
Cc: David Sterba <dsterba@suse.cz>, Nick Desaulniers <ndesaulniers@google.com>, Steven Rostedt <rostedt@goodmis.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kees Cook <keescook@chromium.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, LKML <linux-kernel@vger.kernel.org>

> +our $PositionalAttribute	= qr{
> +			__must_check|
> +			__printf|

I suggest to put all key words which share the leading underscores
into another alternation for an improved regular expression.

Regards,
Markus
