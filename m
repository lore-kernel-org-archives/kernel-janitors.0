From: Shuah Khan <skhan@linuxfoundation.org>
Date: Tue, 29 Sep 2020 13:42:49 +0000
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate statements
Message-Id: <cd75e2d1-9923-b725-78cd-fd5611431584@linuxfoundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <CAMj1kXGh+CzuXkAnqsoMO2A3T1p=D6uFOV347Ym5+VFn5U1gWg@mail.gmail.com>
 <20200929124108.GY4282@kadam>
 <alpine.DEB.2.22.394.2009291445050.2808@hadrien>
 <5f0d2b20f5088281363bb4a35c5652a2c087f159.camel@perches.com>
In-Reply-To: <5f0d2b20f5088281363bb4a35c5652a2c087f159.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Julia Lawall <julia.lawall@inria.fr>, Dan Carpenter <dan.carpenter@oracle.com>, Shuah Khan <shuah@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, linux-iio@vger.kernel.org, drbd-dev@tron.linbit.com, =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>, David Lechner <david@lechnology.com>, Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-wireless@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, linux-block@vger.kernel.org, linux-ide@vger.kernel.org, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, openipmi-developer@lists.sourceforge.net, linux-clk@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>, Shuah Khan <skhan@linuxfoundation.org>

On 9/29/20 7:34 AM, Joe Perches wrote:
> On Tue, 2020-09-29 at 14:47 +0200, Julia Lawall wrote:
>> On Tue, 29 Sep 2020, Dan Carpenter wrote:
>>> The times where commas are used deliberately to replace curly braces are
>>> just evil.  Either way the code is cleaner with semi-colons.
>>
>> I also found exaamples like the following to be particularly unforunate:
>>
>>                                  fprintf(stderr,
>>                                          "page_nr %lu wrong count %Lu %Lu\n",
>>                                         page_nr, count,
>>                                         count_verify[page_nr]), exit(1);
>>
>> The exit is very hard to see, unless you know to look for it.
> 
> I sent that patch last month.
> https://patchwork.kernel.org/patch/11734877/
> 

I see what happened. This patch touches lib, cpupower, and selftests.
Guess lost in the limbo of who takes it.

  tools/lib/subcmd/help.c                    |  10 +-
  tools/power/cpupower/utils/cpufreq-set.c   |  14 +-
  tools/testing/selftests/vm/gup_benchmark.c |  18 +-
  tools/testing/selftests/vm/userfaultfd.c   | 296 +++++++++++++--------
  4 files changed, 210 insertions(+), 128 deletions(-)

I can take it through one of my trees.

thanks,
-- Shuah
