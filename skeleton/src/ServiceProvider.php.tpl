<?php echo "<?php\n"; ?>

namespace <?php echo $vendor; ?>\<?php echo $package; ?>;

class ServiceProvider extends \Illuminate\Support\ServiceProvider
{
    const CONFIG_PATH = __DIR__ . '/../config/<?php echo $configFileName; ?>.php';

    public function boot()
    {
        $this->publishes([
            self::CONFIG_PATH => config_path('<?php echo $configFileName; ?>.php'),
        ], 'config');

        // $this->loadRoutesFrom(__DIR__.'/routes.php');
        // $this->loadMigrationsFrom(__DIR__.'/migrations');
        // $this->loadTranslationsFrom(__DIR__.'/translations', '<?php echo $aliasName; ?>');
        // $this->loadViewsFrom(__DIR__.'/views', '<?php echo $aliasName; ?>');

        /*
        $this->publishes([
        __DIR__.'/path/to/assets' => public_path('vendor/courier'),
        ], 'public');
        */
    }

    public function register()
    {
        $this->mergeConfigFrom(
            self::CONFIG_PATH,
            '<?php echo $configFileName; ?>'
        );

        $this->app->bind('<?php echo $aliasName; ?>', function () {
            return new <?php echo $package; ?>();
        });
    }
}
