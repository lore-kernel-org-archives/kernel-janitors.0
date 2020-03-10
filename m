From: Jonathan Corbet <corbet@lwn.net>
Date: Tue, 10 Mar 2020 17:30:03 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to kobject doc ReST conversion
Message-Id: <20200310113003.0d6d301d@lwn.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200304110821.7243-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200304110821.7243-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Sameer Rahmani <lxsameer@gnu.org>, linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed,  4 Mar 2020 12:08:21 +0100
Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit 5fed00dcaca8 ("Documentation: kobject.txt has been moved to
> core-api/kobject.rst") missed to adjust the entry in MAINTAINERS.
> 
> Since then, ./scripts/get_maintainer.pl --self-test complains:
> 
>   warning: no file matches F: Documentation/kobject.txt
> 
> Adjust DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS entry in MAINTAINERS.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Sameer, please ack.
> Jonathan, pick pick this patch for doc-next.

Applied, thanks.

jon
