From: Gerd Hoffmann <kraxel@redhat.com>
Date: Fri, 14 Sep 2018 09:45:38 +0000
Subject: Re: [PATCH] udmabuf: fix error code in map_udmabuf()
Message-Id: <20180914094538.xied3d2zgg5b2atr@sirius.home.kraxel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180914065615.GA12043@mwanda>
In-Reply-To: <20180914065615.GA12043@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linaro-mm-sig@lists.linaro.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org

On Fri, Sep 14, 2018 at 09:56:15AM +0300, Dan Carpenter wrote:
> We accidentally forgot to set "ret" on this error path so it means we
> return NULL instead of an error pointer.  The caller checks for NULL and
> changes it to an error pointer so it doesn't cause an issue at run time.

Pushed to drm-misc-next.

thanks,
  Gerd
