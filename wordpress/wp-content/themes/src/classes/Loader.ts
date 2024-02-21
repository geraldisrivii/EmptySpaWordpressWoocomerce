class Loader {

    private loadedCounter: number = 0;

    private counter: number = 0;
    public constructor(counter: number) {
        this.counter = counter;
    }
    public load(): void {
        this.loadedCounter++;

        this.afterLoad()
    }
    public restart(count?: number): void {
        if (count) {
            this.counter = count
        }

        this.loadedCounter = 0;
    }
    public onAllisLoaded: () => void;
    private afterLoad(): void {

        if (this.loadedCounter != this.counter) {
            return;
        }

        if (this.onAllisLoaded) {
            return this.onAllisLoaded();
        }
    }
}
