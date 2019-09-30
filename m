From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 30 Sep 2019 07:16:30 +0000
Subject: Re: [PATCH] lightnvm: prevent memory leak in nvm_bb_chunk_sense
Message-Id: <d44a6dca-006e-5bcc-64b4-2b62cf9a9769@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190930023415.24171-1-navid.emamdoost@gmail.com>
In-Reply-To: <20190930023415.24171-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-block@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Matias Bjorling <mb@lightnvm.io>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> To fix this issue I moved the __free_page call before error check.

Would the wording “Move the __free_page() call before the error check.”
be more succinct for the change description?

Can the following code variant be applied at the end of this function?

 	return ret ? ret : rqd.error;

Regards,
Markus
