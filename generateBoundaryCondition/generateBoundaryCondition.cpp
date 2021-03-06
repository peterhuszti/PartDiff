#include <iostream>
#include <stdlib.h>
#include <fstream>
#include <vector>
#include <time.h>

#define N 5
#define DB (4*N - 4)
#define LO -1
#define HI 1

using namespace std;

int main()
{
	ofstream outputStream("grid.txt");

	outputStream << "This file contains Dirichlet boundary conditions for the multigrid method.\n";
	outputStream << "The default grid is [-1;1]x[-1;1]\n";
	outputStream << "The default range of the condition values: [-1;1], generated by generateBoundaryCondition.cpp\n";
	outputStream << "N\nxi yi u\n";
	outputStream << "Where N the number of points at the bound of the grid\n";
	outputStream << "[xi;yi] a point at the bound of the grid\n";
	outputStream << "u is the condition at this point\n@\n";
	outputStream << DB << "\n";

	srand(static_cast <unsigned> (time(0)));
	vector<double> u;
	vector<double> gridPoints;

	for(int i=0; i<N; ++i)
	{
		gridPoints.push_back(i*( static_cast<double> (abs(HI)+abs(LO)) )/(N-1) + LO);
	}

	for(int i=0; i<DB; ++i)
	{
		u.push_back(LO + static_cast<double> (rand()) /( static_cast<double> (RAND_MAX/(HI-LO))));
	}

	for(int i=0; i<N; ++i)
	{
		outputStream << gridPoints[i] << " " << gridPoints[0] << " " << u[i] << "\n";
	}
	for(int i=1; i<N; ++i)
	{
		outputStream << gridPoints[N-1] << " " << gridPoints[i] << " " << u[i+N-1] << "\n";
	}
	for(int i=1; i<N; ++i)
	{
		outputStream << gridPoints[N-i-1] << " " << gridPoints[N-1] << " " << u[i + 2*N - 2] << "\n";
	}
	for(int i=1; i<N-1; ++i)
	{
		outputStream << gridPoints[0] << " " << gridPoints[N-i-1] << " " << u[i + 3*N - 3] << "\n";
	}

	outputStream.close();

	return 0;
}
