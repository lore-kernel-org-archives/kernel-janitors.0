From: Stephen Boyd <sboyd@kernel.org>
Date: Wed, 25 Mar 2020 02:36:58 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust entry to ICST clocks YAML schema creation
Message-Id: <158510381898.125146.5862992017032580482@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200323184501.5756-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200323184501.5756-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Rob Herring <robh@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, linux-arm-kernel@lists.infradead.org

Quoting Lukas Bulwahn (2020-03-23 11:45:01)
> Commit 78c7d8f96b6f ("dt-bindings: clock: Create YAML schema for ICST
> clocks") transformed arm-integrator.txt into arm,syscon-icst.yaml, but did
> not adjust the reference to that file in the ARM INTEGRATOR, VERSATILE AND
> REALVIEW SUPPORT entry in MAINTAINERS.
> 
> Hence, since then, ./scripts/get_maintainer.pl --self-test complains:
> 
>   warning: no file matches \
>   F: Documentation/devicetree/bindings/clock/arm-integrator.txt
> 
> Update the file entry in MAINTAINERS to the new transformed yaml file.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Mauro got here already

 https://lkml.kernel.org/r/491d2928a47f59da3636bc63103a5f63fec72b1a.1584966325.git.mchehab+huawei@kernel.org
