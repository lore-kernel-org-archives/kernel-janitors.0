From: Bjorn Helgaas <bhelgaas@google.com>
Date: Mon, 19 Aug 2013 20:04:24 +0000
Subject: Re: [PATCH 1/7] PCI: tegra: replace devm_request_and_ioremap by devm_ioremap_resource
Message-Id: <CAErSpo5oOnfhi+aRi-Z3kCwS1VpYSO6FX5O_MOZmWNLcfhhA9w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376911241-27720-1-git-send-email-Julia.Lawall@lip6.fr>
 <1376911241-27720-2-git-send-email-Julia.Lawall@lip6.fr> <20130819120249.GA5740@ulmo>
In-Reply-To: <20130819120249.GA5740@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, kernel-janitors@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Aug 19, 2013 at 6:02 AM, Thierry Reding
<thierry.reding@gmail.com> wrote:

> Bjorn, how do you want to handle patches to the Tegra PCIe driver in the
> future? Do you want me to prepare a branch and pull from that or would
> you rather just take simple patches?

I'm in the habit of applying patches from email, so that's easy for
me.  But a branch would be OK, too.

Bjorn
