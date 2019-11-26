From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Tue, 26 Nov 2019 13:46:02 +0000
Subject: Re: [PATCH] spi: pic32: Fix an error code in pic32_spi_dma_prep()
Message-Id: <c71a7703-7a30-b79f-43bb-a1448c298c69@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191126122324.v3rj7oscvjobhjxo@kili.mountain>
In-Reply-To: <20191126122324.v3rj7oscvjobhjxo@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Hi Geet,

On 26/11/2019 15.38, Geert Uytterhoeven wrote:
> Hi Péter,
> 
> On Tue, Nov 26, 2019 at 2:32 PM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
>> On 26/11/2019 15.27, Geert Uytterhoeven wrote:
>>> On Tue, Nov 26, 2019 at 1:51 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>>>> We accidentally return success on this error path.
>>>>
>>>> Fixes: eb7e6dc6d9ff ("spi: pic32: Retire dma_request_slave_channel_compat()")
>>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>> ---
>>>>  drivers/spi/spi-pic32.c | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/spi/spi-pic32.c b/drivers/spi/spi-pic32.c
>>>> index 156961b4ca86..93fb95073522 100644
>>>> --- a/drivers/spi/spi-pic32.c
>>>> +++ b/drivers/spi/spi-pic32.c
>>>> @@ -633,7 +633,8 @@ static int pic32_spi_dma_prep(struct pic32_spi *pic32s, struct device *dev)
>>>>                 goto out_err;
>>>>         }
>>>>
>>>> -       if (pic32_spi_dma_config(pic32s, DMA_SLAVE_BUSWIDTH_1_BYTE))
>>>> +       ret = pic32_spi_dma_config(pic32s, DMA_SLAVE_BUSWIDTH_1_BYTE);
>>>> +       if (ret)
>>>>                 goto out_err;
>>>
>>> This used to be non-fatal, as DMA was optional, cfr. the comment:
>>>
>>>         /* optional DMA support */
>>>         ret = pic32_spi_dma_prep(pic32s, &pdev->dev);
>>>         if (ret)
>>>                 goto err_bailout;
>>>
>>> However, as of the aforementioned commit, DMA is no longer optional,
>>> and probe will fail instead of falling back to PIO on DMA init failure...
>>
>> It is still optional. It only handles deferred probing. If the DMA
>> request fails then it returns 0 and the driver falls back to PIO.
> 
> Oops, I missed that ret is only set to a non-zero value in case of
> probe deferral.
> 
> Sorry for that, seen too many broken patches today ;-)

You made me double check the patch to make sure I'm not contributing to
the broken patch count ;)

>> And this is why I have not changed the pic32_spi_dma_config() error
>> handling.
> 
> Right. So Dan's patch is wrong, as it makes this a hard failure, preventing
> fallback to PIO.

It is unlikely that it would fail, but probably it worth considering to
add a warning in case it happens.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
