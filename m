From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 31 Jan 2020 08:15:14 +0000
Subject: Re: [PATCH net] device property: change device_get_phy_mode() to prevent signedess bugs
Message-Id: <CAHp75Vc7eudHy=05nHKB2==QJM1f23E1jZw=7yFKHA1nq0qBqA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200131045953.wbj66jkvijnmf5s2@kili.mountain>
In-Reply-To: <20200131045953.wbj66jkvijnmf5s2@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ajay Gupta <ajayg@nvidia.com>, "David S. Miller" <davem@davemloft.net>, "Rafael J. Wysocki" <rafael@kernel.org>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Keyur Chudgar <keyur@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Steve Glendinning <steve.glendinning@shawell.net>, Jassi Brar <jaswinder.singh@linaro.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, kernel-janitors@vger.kernel.org

On Fri, Jan 31, 2020 at 7:03 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The device_get_phy_mode() was returning negative error codes on
> failure and positive phy_interface_t values on success.  The problem is
> that the phy_interface_t type is an enum which GCC treats as unsigned.
> This lead to recurring signedness bugs where we check "if (phy_mode < 0)"
> and "phy_mode" is unsigned.
>
> In the commit 0c65b2b90d13 ("net: of_get_phy_mode: Change API to solve
> int/unit warnings") we updated of_get_phy_mode() take a pointer to
> phy_mode and only return zero on success and negatives on failure.  This
> patch does the same thing for device_get_phy_mode().  Plus it's just
> nice for the API to be the same in both places.


> +       err = device_get_phy_mode(dev, &config->phy_interface);

> +       if (err)
> +               config->phy_interface = PHY_INTERFACE_MODE_NA;

Do you need these? It seems the default settings when error appears.

-- 
With Best Regards,
Andy Shevchenko
