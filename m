From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 15 Feb 2010 13:47:24 +0000
Subject: Re: bug list: range checking issues
Message-Id: <20100215134724.GA4107@x200>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100215124046.GB18821@bicker>
In-Reply-To: <20100215124046.GB18821@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 15, 2010 at 03:40:56PM +0300, Dan Carpenter wrote:
> kernel/pid_namespace.c +96 create_pid_namespace(26) warn: buffer overflow 'ns->pidmap' 1 <= 1

What overflows exactly here?
