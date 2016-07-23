From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 23 Jul 2016 14:56:14 +0000
Subject: is_err checking
Message-Id: <alpine.DEB.2.10.1607231653440.3490@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Code like the following looks a bit clunky to me:

if (IS_ERR(data->clk) && PTR_ERR(data->clk) != -EPROBE_DEFER)

Is there any reason not to always use eg

data->clk = ERR_PTR(-EPROBE_DEFER)

Code of the latter form is a bit more popular.  Perhaps one could want
something like:

IS_ERR_VALUE(data->clk, -EPROBE_DEFER)

but IS_ERR_VALUE is laready used for something else.

julia
