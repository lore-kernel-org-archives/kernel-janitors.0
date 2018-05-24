From: Peter Rosin <peda@axentia.se>
Date: Thu, 24 May 2018 11:53:28 +0000
Subject: Re: [PATCH 1/3] i2c: mux: pca954x: merge calls to of_match_device and of_device_get_match_data
Message-Id: <7b1eed5f-a43b-b254-8f88-cfbe8bd04bf5@axentia.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1526896150-27134-1-git-send-email-Julia.Lawall@lip6.fr>
 <1526896150-27134-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1526896150-27134-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Himanshu Jha <himanshujha199640@gmail.com>

On 2018-05-21 11:49, Julia Lawall wrote:
> Drop call to of_match_device, which is subsumed by the subsequent
> call to of_device_get_match_data.  The code becomes simpler, and a
> temporary variable can be dropped.

Thanks for your patch!

Applied to i2c-mux/for-next

Cheers,
Peter
