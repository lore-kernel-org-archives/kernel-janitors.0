From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Thu, 04 Feb 2021 15:24:24 +0000
Subject: Re: [PATCH] kgdb: rectify kernel-doc for kgdb_unregister_io_module()
Message-Id: <20210204152424.wrq3bgmq77fssjwj@maple.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210125144847.21896-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210125144847.21896-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Jason Wessel <jason.wessel@windriver.com>, Douglas Anderson <dianders@chromium.org>, kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jan 25, 2021 at 03:48:47PM +0100, Lukas Bulwahn wrote:
> The command 'find ./kernel/debug/ | xargs ./scripts/kernel-doc -none'
> reported a typo in the kernel-doc of kgdb_unregister_io_module().
> 
> Rectify the kernel-doc, such that no issues remain for ./kernel/debug/.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied. Thanks.
