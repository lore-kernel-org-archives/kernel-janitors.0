From: Mark Brown <broonie@kernel.org>
Date: Mon, 11 May 2020 11:25:11 +0000
Subject: Re: [PATCH -next] ASoC: SOF: core: fix error return code in sof_probe_continue()
Message-Id: <158919630591.8372.2693006903071941501.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200509093337.78897-1-weiyongjun1@huawei.com>
In-Reply-To: <20200509093337.78897-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Baluta <daniel.baluta@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, Wei Yongjun <weiyongjun1@huawei.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Hulk Robot <hulkci@huawei.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org

On Sat, 9 May 2020 09:33:37 +0000, Wei Yongjun wrote:
> Fix to return negative error code -ENOMEM from the IPC init error
> handling case instead of 0, as done elsewhere in this function.

Applied to

   local tree asoc/for-5.7

Thanks!

[1/1] ASoC: SOF: core: fix error return code in sof_probe_continue()
      (no commit info)

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
