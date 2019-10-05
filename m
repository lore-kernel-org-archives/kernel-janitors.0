From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 05 Oct 2019 14:34:09 +0000
Subject: Re: [PATCH] of: unittest: fix memory leak in unittest_data_add
Message-Id: <50421413-f535-a608-fa7d-1b337eeb95e5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004185847.14074-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191004185847.14074-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, devicetree@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> In unittest_data_add, a copy buffer is created via kmemdup. This buffer
> is leaked if of_fdt_unflatten_tree fails. The release for the
> unittest_data buffer is added.

Can a wording like the following be nicer for the change description?

  The buffer “__dtb_testcases_begin” will be duplicated to the local
  variable “unittest_data”. Release the corresponding memory
  after a call of the function “of_fdt_unflatten_tree” failed
  in the implementation of the function “unittest_data_add”.


Regards,
Markus
