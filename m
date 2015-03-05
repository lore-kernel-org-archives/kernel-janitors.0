From: Lars-Peter Clausen <lars@metafoo.de>
Date: Thu, 05 Mar 2015 12:03:32 +0000
Subject: Re: [alsa-devel] [PATCH] ASoC: simple-card: Add a NULL pointer check in asoc_simple_card_dai_link_of
Message-Id: <54F84614.3020108@metafoo.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150303132900.GA22246@vishal> <54F76B43.3030602@bfs.de> <CAC3a_SDWqGLsgUu8_mRYkW=Y+KHvWvAWjUYr4Ba3BrDBiP6nNA@mail.gmail.com>
In-Reply-To: <CAC3a_SDWqGLsgUu8_mRYkW=Y+KHvWvAWjUYr4Ba3BrDBiP6nNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vishal.thanki@gmail.com, wharms@bfs.de
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>

On 03/05/2015 11:45 AM, Vishal Thanki wrote:
> I am new to kasprintf. I think we need to make sure of freeing memory
> allocated using kasprintf.

There is also devm_kasprintf().

But these are really two separate things. One thing is the missing NULL 
check, which is a bug fix and is fixed by your patch. The other thing is the 
conversion to kasprintf() which is a code cleanup and should be done in a 
separate patch.

- Lars

