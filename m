From: Jiri Kosina <jikos@kernel.org>
Date: Tue, 22 Sep 2020 09:20:22 +0000
Subject: Re: [PATCH] HID: alps: clean up indentation issue
Message-Id: <nycvar.YFH.7.76.2009221119570.3336@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200920141716.32919-1-colin.king@canonical.com>
In-Reply-To: <20200920141716.32919-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 20 Sep 2020, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> There is an if statement that is indented too deeply, fix
> this by removing the extraneous tab.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/hid/hid-alps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-alps.c b/drivers/hid/hid-alps.c
> index a9c2de95c5e2..3feaece13ade 100644
> --- a/drivers/hid/hid-alps.c
> +++ b/drivers/hid/hid-alps.c
> @@ -526,7 +526,7 @@ static int u1_init(struct hid_device *hdev, struct alps_dev *pri_data)
>  
>  	ret = u1_read_write_register(hdev, ADDRESS_U1_NUM_SENS_Y,
>  			&sen_line_num_y, 0, true);
> -		if (ret < 0) {
> +	if (ret < 0) {
>  		dev_err(&hdev->dev, "failed U1_NUM_SENS_Y (%d)\n", ret);

I am usually not taking whitespace fixes, but this one actually really 
does improve code readability, so I am taking this one. Thanks,

-- 
Jiri Kosina
SUSE Labs
